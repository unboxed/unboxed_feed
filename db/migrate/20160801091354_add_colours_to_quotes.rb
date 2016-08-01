class AddColoursToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :background_colour, :string
    add_column :quotes, :text_colour, :string
  end
end
