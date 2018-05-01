class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.creation_confirmation.subject
  #
  def creation_confirmation(product)
    @product = restaurant

    mail(
      to:       @product.user.email,
      subject:  "Your article #{@product.title} is now to rent!"
    )

  end
end
