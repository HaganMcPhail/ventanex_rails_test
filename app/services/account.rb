class Account
  def self.account_number
    parse_hash
  end

  private

  def self.parse_hash
    hash = Hash.from_xml(file_data)
    ap hash.dig("Envelope",
                "Body",
                "FlexAccountViewProviderReadResponse",
                "FlexAccountViewProviderReadRs",
                "ResponseBody",
                "LoanNumber")
  end

  def self.file_data
    file = Rails.application.assets['loan.xml'].pathname
    File.read(file)
  end
end
