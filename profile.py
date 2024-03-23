# Import the Portal object.
import geni.portal as portal

# Import the ProtoGENI library.
import geni.rspec.pg as pg

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()
 
# Add a raw PC to the request.
node = request.RawPC("node")

# Allocate a node and ask for a 30GB file system mounted at /mydata
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops//UBUNTU20-64-STD"

# Install and execute a script that is contained in the repository.
node.addService(pg.Execute(shell="bash", command="bash /local/repository/start-webserver.sh"))

# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
