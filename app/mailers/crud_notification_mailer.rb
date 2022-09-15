class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object=object
    @object_count = object.class.count


    mail to: 'ammadjahangir88@gmail.com' , subject: "A new Entry for #{object.class} has been created" 
  end
end
