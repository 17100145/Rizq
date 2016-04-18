FactoryGirl.define do
  factory :user do
    username 'factorygirl'
    age 30
    email 'sherkhan@gmail.com'
    password 'abc12345'
    password_confirmation 'abc12345'
    firstname 'Sher'
    lastname 'Khan'
    address 'DHA'
    organization 'LUMS'
    designation 'manager'
    phone '090078601'
    cnic '331008112345'
    
  end
end