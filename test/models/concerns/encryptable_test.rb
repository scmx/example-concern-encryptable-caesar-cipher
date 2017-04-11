require 'test_helper'

describe Encryptable do
  describe 'include' do
    class Dummy
      include Encryptable
    end

    it 'defines the encryptable method' do
      expect(Dummy).must_respond_to(:encryptable)
    end
  end

  describe '.encryptable' do
    class Dummy
      include Encryptable
      encryptable :secret
      attr_accessor :secret_encrypted
    end

    describe 'setter' do
      it 'is defined' do
        dummy = Dummy.new
        expect(dummy).must_respond_to(:secret=)
      end

      it 'works' do
        dummy = Dummy.new
        dummy.secret = 'superhemligt'
        expect(dummy.secret_encrypted).wont_be_empty
      end
    end

    describe 'getter' do
      it 'is defined' do
        dummy = Dummy.new
        expect(dummy).must_respond_to(:secret)
      end

      it 'works' do
        dummy = Dummy.new
        dummy.secret_encrypted = 'Xiyboq'
        expect(dummy.secret).must_equal('Albert')
      end
    end
  end
end
