FactoryGirl.define do

    factory :user do |f|
        f.email {'admin@mail.com'}
        f.password {'52145214'}
    end
    
end