FactoryBot.define do
  factory :room_user do
    association :user
    association :room
    #associationはFactoryBotによって生成されるモデルを関連づけるメソッド
  end
end