# kitchen Testcases

# Listen port 80
describe port(80) do
  it { should be_listening }
end

# Listen to port 3306
describe port(3306) do
  it { should be_listening }
end
