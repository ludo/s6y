require 'helper'

class TestS6y < Test::Unit::TestCase
  def test_shortify_nil_value
    assert_equal "", S6y.shortify(nil)
  end

  def test_shortify_single_word
    assert_equal "I18n", S6y.shortify("Internationalization")
  end

  def test_shortify_single_character
    assert_equal "A", S6y.shortify("A")
  end

  def test_shortify_two_character_word
    assert_equal "it", S6y.shortify("it")
  end

  def test_shortify_sentence
    assert_equal "I18n. w2h . s2e d2s, a1d c4s.", S6y.shortify("Internationalization. with . some dots, and commas.")
    assert_equal "L3m i3m d3r s1t a2t.", S6y.shortify("Lorem ipsum dolor sit amet.")
  end

  def test_shortify_paragraph
    assert_equal "L3m I3m is s4y d3y t2t of t1e p6g a1d t9g i6y. L3m I3m h1s b2n t1e i6y's s6d d3y t2t e2r s3e t1e 1500s, w2n an u5n p5r t2k a g4y of t2e a1d s7d it to m2e a t2e s6n b2k. It h1s s6d n1t o2y f2e c7s, b1t a2o t1e l2p i2o e8c t9g, r7g e9y u7d. It w1s p9d in t1e 1960s w2h t1e r5e of L6t s4s c8g L3m I3m p6s, a1d m2e r6y w2h d5p p8g s6e l2e A3s P7r i7g v6s of L3m I3m.", S6y.shortify("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
  end

  def test_do_not_shortify_dates
    assert_equal "2010-04-01", S6y.shortify(Date.parse('2010-04-01'))
  end

  def test_do_not_shortify_numbers
    assert_equal "T2t 123456789", S6y.shortify("Test 123456789")
  end
end
