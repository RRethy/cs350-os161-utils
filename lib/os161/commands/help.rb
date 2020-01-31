module OS161
  module Commands
    class Help
      class << self
        def call
          puts <<-EOF
os161util [OPTION]

os161util is a utility command to help with the development of os161 in CS350 at
UWaterloo.

Options can be combined and ordering with no get wack; building will always be
done before running anything. For example, `--run --build` will build the
kernel, then run the simulator.

OPTIONS:
--help, -h:
    show help
--build, -b:
    build the kernel specified by -r (which has a good default heuristic).
--run, -r:
    run the simulator with the specified version or using the same heuristic as
    --build.
--assignment_number integer, -r integer:
    specifies which kernel version to build and use.
    By default it'll use a heuristic based on hardcoded assignment deadlines
    for W20 to determine which version of the kernel to build. You can specify
    a specific kernel version with --assignment_number (-r).
EOF
        end
      end
    end
  end
end
