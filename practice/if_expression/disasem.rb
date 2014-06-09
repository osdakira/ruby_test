iseq = RubyVM::InstructionSequence.compile_file ARGV.first, false
print iseq.disasm
