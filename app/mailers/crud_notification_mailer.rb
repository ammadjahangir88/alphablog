class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object=object
    @object_count = object.class.count
    mail(to: object.user.email, from: 'ammadjahangir88@gmail.com', subject: "A new Entry for #{object.class} has been created" , message: "Hi")
   
  end

  def update_notification(object)

    @object=object
    @object_count = object .class.count
    mail(to: object.user.email, from: 'ammadjahangir88@gmail.com', subject: "An #{object.class} has been successfully updated" , message: "Hi")
    
  end
end
