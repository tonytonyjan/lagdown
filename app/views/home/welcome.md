Markdown
==========
My favorite things:

* Programming
* Piano
* Ponytail Girl

Code
==========
```ruby
class User
  attr_accessor :name, :age, :length
  def initialize **params
    params.each{ |key, value| send("#{key}=", value) }
  end
end
User.new name: "tonytonyjan", age: 24, length: 30
```

Math
==========
When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$ and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$