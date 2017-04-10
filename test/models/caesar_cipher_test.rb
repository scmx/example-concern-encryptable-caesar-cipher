require 'test_helper'

describe CaesarCipher do
  cases = [
    %w(
      ABCDEFGHIJKLMNOPQRSTUVWXYZ
      XYZABCDEFGHIJKLMNOPQRSTUVW
    ),
    %w(
      abcdefghijklmnopqrstuvwxyz
      xyzabcdefghijklmnopqrstuvw
    ),
    [
      'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG',
      'QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD'
    ],
    [
      'the quick brown fox jumps over the lazy dog',
      'qeb nrfzh yoltk clu grjmp lsbo qeb ixwv ald'
    ]
  ]

  let(:cipher) { CaesarCipher.new }

  describe '#encrypt' do
    cases.each do |(input, expected)|
      it "encrypts #{input} into #{expected}" do
        actual = cipher.encrypt(input)
        expect(actual).must_equal(expected)
      end
    end
  end

  describe '#decrypt' do
    cases.each do |(expected, input)|
      it "decrypts #{input} into #{expected}" do
        actual = cipher.decrypt(input)
        expect(actual).must_equal(expected)
      end
    end
  end
end
