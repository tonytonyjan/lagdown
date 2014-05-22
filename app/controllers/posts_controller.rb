require "rss"

class PostsController < ApplicationController
  before_action :set_blog, only: %i[index show rss]
  before_action :set_post, only: %i[show]
  before_action :set_user, only: %i[rss]
  before_action :set_view_count,only: %i[show]
  authorize_resource except: [:preview,:rss]
  layout 'blog'

  def index
    @posts = @blog.posts.order(created_at: :desc).page(params[:page])
  end

  def show
    description = LagdownRenderer.render(@post.content)[/<p>([^<].*)<\/p>/, 1]
    @title =  "#{@post.title} - #{@blog.name}"
    @meta_hash = {
      author: @blog.user.try(:nickname),
      description: description,
      generator: :lagdown
    }
    @og_hash = {
      title: @title,
      type:  :website,
      url: post_url(@post),
      description: description
    }
  end

  def preview
    render text: LagdownRenderer.render(params[:text].to_s)
  end

  def rss
    @rss = RSS::Maker.make("2.0") do |maker|
      maker.channel.language = "en"
      maker.channel.author = @blog.subdomain
      maker.channel.updated = Time.now.to_s
      maker.channel.link = root_url(host: Settings.host, subdomain: @blog.subdomain)
      maker.channel.title = @user.nickname + "'s Lagdown Blog"
      maker.channel.description = "Lagdown - The Markdown Blogging System"
      maker.channel.copyright = "Copyright © 2014 Lagdown-Blogging System. All rights reserved"

      @blog.posts.each do |p|
        maker.items.new_item do |item|
          item.link = post_url(p, subdomain: @blog.subdomain)
          item.author = @blog.subdomain
          item.title = p.title
          item.description = p.content.slice(1..100) + " ......"
          item.updated = p.updated_at.to_s
        end
      end
    end
    # respond_to do |format|
    #   format.xml { render :xml => @rss.to_xml }
    # end
    render :xml => @rss.to_xml
  end

private
  def set_blog
    @blog = Blog.find_by_subdomain! request.subdomain
  end

  def set_post
    @post = @blog.posts.find(params[:id])
  end

  def set_user
    @user = Blog.find_by_subdomain!(request.subdomain).user
  end

  def set_view_count
    # clear the setting_time ip_session
    Session.sweep(10.second)

    ip_nil = Session.where(ip: request.remote_ip).first.nil?

    if ip_nil
      # add count
      count = @post.view_count
      count += 1
      @post.update_columns(view_count: count)
      # add ip session
      Session.create(ip: request.remote_ip)
    else
    end
  end

end
