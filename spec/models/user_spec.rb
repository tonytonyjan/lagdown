describe User do
  Then { expect(subject).to have_many :blogs }
  Then { expect(subject).to have_many :o_auth_credentials }
end