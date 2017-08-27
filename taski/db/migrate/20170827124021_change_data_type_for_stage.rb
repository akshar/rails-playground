class ChangeDataTypeForStage < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :stage, :string
  end
end
