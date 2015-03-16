FactoryGirl.define do

    factory :user do |f|
        f.email {'admin@mail.com'}
        f.password {'52145214'}
    end

    factory :admin do |f|
        f.first_name {"tyler" }
        f.last_name { "durden" }
        f.address { "3 rue du test" }
        f.zip_code { "13510" }
        f.city { "marseille" }
        f.country { "france" }
        f.tel { "0492556087" }
        user
    end
    factory :invalid_admin, class: Admin do |f|
        user
        f.first_name {"tyler" }
        f.last_name { "durden" }
        f.address { "3 rue du test" }
        f.zip_code { "abcdefgh" }
        f.city { "marseille" }
        f.country { "france" }
        f.tel { "123abcde" }
    end
end