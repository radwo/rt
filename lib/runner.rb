require 'childprocess'
require 'tempfile'
require 'pry'

class Runner
  def initialize(program_content)
    @program_content = program_content
  end

  def run
    process.start
  end

  def result
    File.read(result_file)
  end

  def finished?
    process.exited?
  end

  def succesed?
    process.exit_code.zero?
  end

  def abort
    process.stop
  end

  private
  attr_reader :program_content

  def process
    @process ||= ChildProcess.build(runner_file.path).tap { |pr|
      pr.io.stdout = result_file
      pr.io.stderr = result_file
    }
  end

  def runner_file
    @runner ||= Tempfile.new("runner").tap { |runner|
      runner.chmod(0700)
      runner.puts %|#!/bin/bash|
      runner.puts %|cd #{File.dirname(program_file)}|
      runner.puts %|gcc -o task #{File.basename(program_file)}|
      runner.puts %|./task|
      runner.close
    }
  end

  def program_file
    @program_file ||= -> {
      program = Tempfile.new("program")
      program.puts(program_content)
      program.close
      File.rename(program.path, "#{program.path}.c")
      File.open("#{program.path}.c")
    }.call
  end

  def result_file
    @result_file ||= Tempfile.new("result")
  end
end
