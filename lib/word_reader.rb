# ruby_version:2.3
# encoding:utf-8

class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    return unless File.exist?(file_name)
    File.readlines(file_name, encoding: 'UTF-8').sample.chomp
  end
end
