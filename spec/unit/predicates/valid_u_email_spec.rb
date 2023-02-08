require 'spec_helper'

describe 'ValidUEmail' do
  let(:hcard) { double('hcard') }
  let(:sut) { ValidUEmail.new }

  before :each do
    allow(hcard).to receive(:respond_to?)
      .with(:email)
      .and_return true
  end

  it 'throws if no u-email' do
    # given
    allow(hcard).to receive(:respond_to?)
      .with(:email)
      .and_return false

    # when
    expect { sut.validate(hcard)}.to raise_error(InvalidMetadataError, 'Email is not set')
  end

  it 'does not throw if correct URL' do
    # given
    expect(hcard).to receive(:email)
      .and_return 'mailto:hi@firozansari.com'

    # when
    sut.validate(hcard)

    # then
    # no error
  end

  it 'throws if email is not a mailto:' do
    # given
    expect(hcard).to receive(:email)
      .and_return 'hi@firozansari.com'

    # when
    expect { sut.validate(hcard)}.to raise_error(InvalidMetadataError, 'Email is not equal to mailto:hi@firozansari.com')

    # then
  end

  it 'throws if email is not mine' do
    # given
    expect(hcard).to receive(:email)
      .and_return 'spam@firozansari.com'

    # when
    expect { sut.validate(hcard)}.to raise_error(InvalidMetadataError, 'Email is not equal to mailto:hi@firozansari.com')

    # then
  end
end
