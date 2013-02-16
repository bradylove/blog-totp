require 'rotp'
require 'qrencoder'

random = ROTP::Base32.random_base32
totp   = ROTP::TOTP.new(random)

qr_string = totp.provisioning_uri("bradylove.com-love.brady@gmail.com")
qr_code   = QREncoder.encode(qr_string)
qr_code.png(pixels_per_module: 4, margin: 1).save("qr_code.png")

loop do
  printf("What is your most excelent OTP? ")

  otp = gets.chop
  puts totp.verify_with_drift(otp, 5)
end
