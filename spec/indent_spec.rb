require_relative './spec_helper'

describe 'indent/scala.vim' do
  each_fixture('indent') do |filename|
    it %' will correctly indent file #{filename}' do
      actual = indent_file(filename)
      actual.must_equal expected(filename)
    end
  end
end

def indent_file(fixture_name)
  with_fixture(fixture_name) do |temp_file|
    if fixture_name.match?(/_line_\d+\.scala$/)
      line = fixture_name[/_line_(\d+)\.scala$/, 1]
      start_vim do |vim|
        vim.edit temp_file.path
        vim.command 'set ft=scala'
        vim.normal %'#{line}gg'
        vim.normal '=='
        vim.write
      end
    else
      start_vim do |vim|
        vim.edit temp_file.path
        vim.command 'set ft=scala'
        vim.normal 'gg'
        vim.normal '=G'
        vim.write
      end
    end
  end
end
