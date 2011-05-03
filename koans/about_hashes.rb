require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutHashes < EdgeCase::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]
    assert_equal "dos", hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => "eins", :two => "dos" }
    assert expected == hash
    # Could replace the two lines above with the one below:
    # assert({ :one => "eins", :two => "dos" } == hash)

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?

    # Bonus Answer: Because apparently, when you aren't using parens, using { }
    # gets parsed as trying to create a block argument instead of as a Hash
    # literal.
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal __, hash1 == hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.keys.size
    assert_equal __, hash.keys.include?(:one)
    assert_equal __, hash.keys.include?(:two)
    assert_equal __, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.values.size
    assert_equal __, hash.values.include?("uno")
    assert_equal __, hash.values.include?("dos")
    assert_equal __, hash.values.class
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal __, hash != new_hash

    expected = { "jim" => __, "amy" => 20, "dan" => 23, "jenny" => __ }
    assert_equal __, expected == new_hash
  end
end
