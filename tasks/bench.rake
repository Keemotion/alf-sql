namespace :bench do

  def bench_cmd
    "bundle exec ruby -Ilib -I spec/integration/ spec/integration/bench_all.rb"
  end

  def alf_cmd(tail)
    "bundle exec alf --ff=%.6f --input-reader=rash #{tail}"
  end

  task :run do
    cmd = bench_cmd
    $stderr.puts cmd
    exec(cmd)
  end

  task :summary do
    cmd = bench_cmd
    cmd << " | "
    cmd << alf_cmd("summarize -- category -- min 'min{ total }' max 'max{ total }' avg 'avg{ total }' stddev 'stddev{ total }'")
    $stderr.puts cmd
    exec(cmd)
  end

  task :rank do
    cmd = bench_cmd
    cmd << " | "
    cmd << alf_cmd("summarize -- category alf -- parsing 'avg{ parsing }' compiling 'avg{ compiling }' printing 'avg{ printing }' total 'avg{ total }'")
    cmd << " | "
    cmd << alf_cmd("rank -- total desc -- position")
    cmd << " | "
    cmd << alf_cmd("project -- position category alf parsing compiling printing total")
    cmd << " | "
    cmd << alf_cmd("restrict -- 'position < 10'")
    $stderr.puts cmd
    exec(cmd)
  end

end
task :bench => :"bench:run"