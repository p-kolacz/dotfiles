# Ruby

- `bin/rails generate controller Articles index --skip-routes`
- `bin/rails generate model Article title:string body:text`
- `bin/rails db:migrate`

## Models

```ruby
class User < ApplicationRecord
  self.table_name = "users_table"
  self.primary_key = "user_id"
  validates :name, presence: true
end

Users.All
User.first
User.find_by(name: "David")
user = User.where(name: "David", occupation: "Artist").order(created_at: :desc)
user.name = "Dave"
user.save
user.update(age: 30)
User.update_all "max_login_attempts = 3, must_change_password = 'true'"
user.destroy
User.destroy_by(name: 'David')	# find and delete all users named David
User.destroy_all				# delete all users

```

- Schema
	- created_at - Automatically gets set to the current date and time when the record is first created.
	- updated_at - Automatically gets set to the current date and time whenever the record is created or updated.
	- lock_version - Adds optimistic locking to a model.
	- type - Specifies that the model uses Single Table Inheritance.
	- (association_name)_type - Stores the type for polymorphic associations.
	- (table_name)_count - Used to cache the number of belonging objects on associations. For example, a comments_count column in an Article class that has many instances of Comment will cache the number of existent comments for each article.

### Migrations

`bin/rails generate migration AddPartNumberToProducts part_number:string`
```ruby
class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class AddPartNumberToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :part_number, :string
  end
end

```

