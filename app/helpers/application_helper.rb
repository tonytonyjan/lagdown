module ApplicationHelper
  def title_tag
    content_tag(:title, @title || t('site_name'))
  end

  def nav_li name, link, match: link
    active = 'active' if request.fullpath[match]
    content_tag :li, link_to(name, link), class: active
  end

  def nav_li_for model, match: model.table_name
    content_tag :li, link_to(model.model_name.human, model),
                class: request.path[match] ? 'active' : nil
  end

  def bootstrap_form_options form_class: nil, label_class: 'col-sm-2', input_wrapper_class: 'col-sm-10'
    if form_class != 'form-horizontal'
      label_class = label_class.split.reject!{|x| x.start_with?('col-')}.join(' ')
      input_wrapper_class = input_wrapper_class.split.reject!{|x| x.start_with?('col-')}.join(' ')
    end
    {
      wrapper: :bootstrap,
      html: {class: form_class},
      defaults: {
        input_html: {class: 'form-control'},
        label_html: {class: label_class},
        input_wrapper_html: {class: input_wrapper_class}
      }
    }
  end

  def notice_message **modes
    modes = {notice: :success, alert: :danger}
    modes.map do |key, value|
      flash[key] ? content_tag(:div, class: "alert alert-#{value} fade in"){
        concat button_tag('×', type: :button, class: 'close', data: {dismiss: :alert, hidden: true})
        concat flash[key]
      } : ''
    end.inject(:+).html_safe
  end

  def li_link_for model, link_url = model
    match = params[:match] || model.table_name
    content_tag :li, class: (request.path[match] ? 'active' : '') do
      link_to model.model_name.human, link_url
    end
  end

  def th_for model, *attr_names
    attr_names.map{|attr_name|
      attr_name = attr_name.first if attr_name.is_a?(Array)
      content_tag :th, model.human_attribute_name(attr_name)
    }.inject(:+)
  end

  def td_for record, *attr_names
    attr_names.map{|attr_name|
      val = if attr_name.is_a?(Array)
              case attr_name.last
              when Proc then attr_name.last.call(record.send(attr_name.first))
              when Symbol then record.send(attr_name.first).send(attr_name.last)
              end
            else
              record.send(attr_name)
            end
      content_tag :td, val
    }.inject(:+)
  end

  def table_for records, *attr_name, show: true, edit: true, destroy: true, colspan: 3, **options, &block
    model_class = records.model
    content_tag :table, **options do
      concat content_tag(:thead){
        concat th_for(model_class, *attr_name)
        concat content_tag(:th, nil, colspan: colspan)
      } # content_tag(:thead)
      concat content_tag(:tbody){
        records.each do |record|
          concat content_tag_for(:tr, record){
            concat td_for(record, *attr_name)
            if block_given? # custom control
              yield record
            else
              concat content_tag :td, show ? link_to_if(can?(:read, record), t('crud.show'), record) : nil
              concat content_tag :td, edit ? link_to_if(can?(:update, record), t('crud.edit'), [:edit, record]) : nil
              concat content_tag :td, destroy ? link_to_if(can?(:delete, record), t('crud.destroy'), record, method: :delete, data: {confirm: t('message.are_you_sure')}) : nil
            end
          }
        end # records.each
      } # content_tag(:tbody)
    end # content_tag(:table)
  end

  def dl_for record, *attr_names
    content_tag_for(:dl, record) do
      attr_names.map do |attr_name|
        case attr_name
        when Array
          concat content_tag :dt, record.class.human_attribute_name(attr_name.first)
          concat content_tag :dd, case attr_name.second
          when Proc then attr_name.last.call(record.send(attr_name.first))
          when Symbol then record.send(attr_name.first).send(attr_name.last)
          end
        else
          concat content_tag :dt, record.class.human_attribute_name(attr_name)
          concat content_tag :dd, record.send(attr_name)
        end
      end # attr_names.map
    end # content_tag
  end # def dl_for

  def gly_icon name,url,gly_type,btn_class,**options
    link_to url,class: "btn #{btn_class}",**options do 
      content_tag :span," #{name}",class: "glyphicon glyphicon-#{gly_type}"
    end
  end

  def button_li name,url
    active = 'active' if request.fullpath == url
    link_to(name, url,class: "btn btn-default #{active}")
  end

end
