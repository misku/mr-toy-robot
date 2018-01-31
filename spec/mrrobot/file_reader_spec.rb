require 'spec_helper'

RSpec.describe Mrrobot::FileReader do
  it 'implements ReaderInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::ReaderInterface)).to be_truthy
  end

  describe '.each_line' do
    let(:file) { double('file') }
    let(:fh) { double('file handle') }
    let(:enumerator) { double('enumerator') }
    let(:lines) { [5, 8, 2] }

    before do
      allow(File).to receive(:open).and_yield(fh)
      allow(fh).to receive(:each_line).and_return(enumerator)
      allow(enumerator).to receive(:lazy).and_return(enumerator)
      allow(enumerator).to receive(:each)
        .and_yield(lines[0])
        .and_yield(lines[1])
        .and_yield(lines[2])
    end

    context 'with valid file path' do
      it 'yields all file lines' do
        expect do |b|
          described_class.each_line(file, &b)
        end.to yield_successive_args(*lines)
      end
    end

    context 'with INvalid file path' do
      it 'does not yield' do
        expect do |b|
          described_class.each_line(nil, &b)
        end.not_to yield_control
      end
    end
  end
end
