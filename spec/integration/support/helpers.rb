module Helpers

  def conn
    Alf.connect(Path.dir, viewpoint: TestViewpoint)
  end

  def strip(x)
    x.strip.gsub(/\s+/, " ").gsub(/\(\s+/, "(").gsub(/\s+\)/, ")")
  end

  def compiler
    @compiler ||= Alf::Sql::Compiler.new
  end

end