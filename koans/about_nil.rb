require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNil < EdgeCase::Koan
  def test_nil_is_an_object
    assert nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # make some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    #
    # I prefer the aesthetics of .nil? From an efficiency perspective, it's hard
    # to imagine it making a difference. Apparently == is implemented as a
    # method, so the function call overhead should be the same between .nil? and
    # == but the implementation of .nil? can be a simple false for every object
    # but nil instead of an identity comparison, so I suppose it is
    # infinitessimally more efficient.
  end
end
