# Code for running the tree learning on the Netlib LPs
include("../src/MyModule.jl")

lp_data_dir = joinpath("benchmarks", "lp_data")
files = [f for f in readdir(lp_data_dir) if contains(f, "mps")]


# For each file perform lerning
files = ["25fv47.mps"]  # TODO: remove this. Just to run only one file

N_op = 5
N_training = 10
N_testing = 5

# TODO: Preallocate variables for debugging
problem = []
theta_bar = []
theta_train = []
theta_test = []
theta_finite = []
radius = 1.0

for f in files
    # Extract problem data
    problem = MyModule.OptimizationProblem(joinpath(lp_data_dir, f))

    # Sample operation points
    theta_bar = MyModule.operation_points(problem, N=N_op)

    # Radius is 10% of the mean of the finite elements of theta_bar
    theta_finite = [t[.!Base.isinf.(t)] for t in theta_bar]
    radius = .1 * mean(norm.(theta_finite, 1))

    # Training: Sample from operation points within Balls
    theta_train = MyModule.sample(theta_bar, radius)
    # Testing: Sample from operation points within Balls
    theta_test = MyModule.sample(theta_bar, radius)

    # TODO: Add function to get elements of the problem given theta

    # Evaluate performance (TODO: Fix infeasibility/suboptimality measures)


end


# Store output of all files