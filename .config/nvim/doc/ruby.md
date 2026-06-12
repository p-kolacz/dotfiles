# Ruby

- %
	- `%[lorem ipsum] %?lorem ipsum? %(lorem ipsum)`
	- % or %Q - interpolated string `%(foo bar)` -> `"foo bar"`
	- %q - non-interpolated string (whole)
	- %W - interpolated array of strings
	- %w - non-interpolated array of strings
	- %I - interpolated array of symbols
	- %i - non-interpolated array of symbols
	- %s - interpolated string - `%s(foo bar)` -> `:"foo bar"`
	- %x - interpolated shell command
	- %r - interpolated regexp

See also:
- [[~/.config/nvim/doc/rails]]

## .. ...

```ruby
(1..5).to_a   # => [1, 2, 3, 4, 5]
(1...5).to_a  # => [1, 2, 3, 4]
(..5)   # x <= 5
(...5)  # x < 5
(5..)   # x >= 5
(5...)  # x >= 5  (no upper bound, so the dot count doesn't change anything)
```
