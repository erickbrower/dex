FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@email.com" }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :token do
    sequence(:value) { |n| "1234567890#{n}" }
    is_active true
    user
  end

  factory :entry do
    sequence(:content) do |n|
      if n % 2 == 0
        <<-eos
          Bacon ipsum dolor sit amet bacon sirloin rump beef shankle flank, 
          corned beef kielbasa sausage chuck. Jerky drumstick rump tri-tip 
          frankfurter turducken kielbasa pork chop t-bone. Beef ribs shank 
          pig biltong tenderloin tongue doner jowl prosciutto short loin 
          flank beef turducken bacon. Cow drumstick tri-tip strip steak 
          prosciutto. Strip steak prosciutto tongue jerky.
        eos
      else
        <<-eos
          Meatloaf cow turkey, pork pig sirloin frankfurter fatback jerky 
          pastrami bresaola filet mignon jowl ham hock ball tip. Sirloin 
          bacon leberkas andouille pork chop, meatloaf pork belly shoulder 
          tenderloin hamburger ground round shankle doner. Jerky shoulder 
          ground round pastrami leberkas. T-bone turkey sausage, ball tip 
          brisket biltong venison chicken shank pork loin shoulder. Flank 
          shankle swine tail leberkas. Shankle ball tip tail pancetta andouille.
        eos
      end
    end
  end
end
