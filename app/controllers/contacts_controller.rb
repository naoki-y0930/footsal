class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:contactsuccess] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      flash[:contacterror] = '正しく入力してください'
      render :new
    end
  end

  private

  def contact_params
     params.require(:contact).permit(:email, :message)
  end
end
