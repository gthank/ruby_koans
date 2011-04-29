require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrays < EdgeCase::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    # Now *THAT* is a funky bit of syntax. It makes sense after I think
    # about it for a minute, but it totally threw me for a loop at first.
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    # Hmm… this is not a friendly syntax. It's like trying to figure
    # out which arguments to pass to substr vs. substring in
    # JavaScript—I always wind up looking it up in the docs.
    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    # OK, see http://stackoverflow.com/questions/3568222/array-slicing-in-ruby-looking-for-explanation-for-illogical-behaviour-taken-fro/3568281#3568281
    # for how Ruby treats array slicing. I have to admit, this completely made no
    # sense to me at first. Now that I understand it, I'm still not really a fan
    # just because it's so different from how most languages do it, and I don't
    # like the same syntax having a different model driving the behavior.
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    # .. is a range operator; it generates a range that is inclusive on both
    # ends, e.g., [low, high]
    assert_equal [:peanut, :butter, :and], array[0..2]
    # ... is a range operator; it generats a range that is exclusive on the top
    # end, e.g., [low, high)
    assert_equal [:peanut, :butter], array[0...2]
    # Another construction that makes your life easier on corner cases, but will
    # also inevitably get misused during your journey to enlightenment.
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1, 2, :last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal __, array

    shifted_value = array.shift
    assert_equal __, shifted_value
    assert_equal __, array
  end

end
