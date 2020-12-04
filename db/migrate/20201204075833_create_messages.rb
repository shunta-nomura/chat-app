class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      #referencesは外部キーのカラムが存在できforeign_key: trueではその値がないと登録できないようにする
      t.timestamps
    end
  end
end
