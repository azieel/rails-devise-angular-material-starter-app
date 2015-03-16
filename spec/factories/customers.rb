FactoryGirl.define do

    factory :customer do |f|
        f.first_name {"albert" }
        f.last_name { "einstein" }
        f.address { "3 rue des oufs" }
        f.zip_code { "13052" }
        f.city { "La lune" }
        f.country { "france" }
        f.tel { "0492556087" }
        user
    end
    factory :invalid_customer, class: Customer do |f|
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