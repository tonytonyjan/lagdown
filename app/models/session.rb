class Session < ActiveRecord::Base
  # scope macros

  # Concerns macros

  # Constants
  
  # Attributes related macros

  # association macros

  # validation macros

  # callbacks

  # other
  
  # session sweep
  def self.sweep time
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end

    delete_all "updated_at < '#{time.ago.to_s(:db)}' OR created_at < '#{2.days.ago.to_s(:db)}'"
  end
  # def self.sweep
  #     self.where("updated_at < ?",10.second.ago).delete_all
  # end

  protected
  # callback methods
end
