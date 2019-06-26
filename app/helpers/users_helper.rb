module UsersHelper
  def ramdom_token
    SecureRandom.uuid.upcase
  end
end
