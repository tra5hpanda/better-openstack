Openstack is not better than a hypervisor. It’s also not the same. 
===================================================================

Hypervisors allow for virtualization; this separates a platforms’ function(s)
from hardware. A cloud environment uses this separation but all to it. Simply
creating a Virtual Machine (VM) only requires a hypervisor. Allocating resource
pools to users is what makes clouding computing unique. Furthermore, these
“clouds” may be orchestrated and automated. Clouds provide users with the option
of self-service building, infrastructure scaling, and dynamic resource pools,
which most clearly distinguish it from traditional virtualization.

Hypervisor == Technology
========================

Hypervisors provide stable, image based means to deliver resources to a user for
long, sustained periods.

Cloud == Methodology
====================

Clouds provide a template based mechanism to deliver variable resources to users
for short periods of time.

Foundation & Vocabulary
=======================

**Heat:** This is the orchestration project in OpenStack, supporting the human-
and machine-accessible service for managing the lifecycle of infrastructure
within OpenStack clouds.

**Template**: Defines a cloud infrastructure in an OpenStack environment. It may
consists of, relationships between objects and how to build it.

Templates should be provide generic resource and configuration definitions.
Templates are assembled to deploy infrastructure and services based on the
required environment and are easy to maintain in as OS and applications move
through their lifecycle.

*Template Components:*

>   **Version:** Template version must be specified. Template specifications are
>   continuously updated and older versions may not support all the features
>   that newer versions do.

1.  **Parameters:** 1st section; May contain information to be passed into the
    Heat template; can be supplied by the user or through an environment file

2.  **Resources: **2nd section; Contains specific objects and their
    configuration that include everything from the instance, routers, networks,
    ports, subnets, security policies etc. Bonus: you can use HOT template
    resources in CFN…but just know that template won’t be AWS compatible.

3.  **Output:** 3rd section; where information can be supplied back to the user.
    This is useful for capturing things like dynamically created passwords, IPs
    for objects etc.

4.  Conditions: Optional section; Can be used with resources or outputs to
    achieve more functionality.

*Templates can be in one of two formats:*

**HOT:** Short for Heat Orchestration Template; HOT is one of two template
formats accepted by Heat. This format is not compatible with AWS CloudFormation
templates and can only be used with OpenStack. HOT format are generally written
as YAML. These templates start with: heat_template_version: 'year-month-day'

>   *YAML's indentation-based scoping is similar to Python. Be very careful that
>   you are always using 2-spaces, and never tabs. Additionally, be careful not
>   to left whitespace (spaces or tabs) in unused areas. This can easily happen
>   when you are copy/pasting and may not be noticed until your stack fails to
>   deploy.*

**CFN:** Short for AWS CloudFormation; this an additional template format
supported by Heat. CFN format templates are generally written as JSON. These
templates start with: "AWSTemplateFormatVersion" : "year-month-day"

**Environment file:** Provides a means to supply user defined variable data to
the template. It creates a situation where more data from the template can be
treated as variable to extend flexibility. This is useful for deploying stacks
without the Horizon interface, via CLI. Horizon provides a window for input of
parameters. It also allows for extending parameter date to nested templates.
Finally, custom resources can be defined and called based on the environment
file.

**Stack:** Collection of resources created by a template. The stack is deployed
from a template, with the option of providing an environment file. A stack may
contain and use any entity type that can live in OpenStack, including servers,
networks, subnets, routers, and even users.

Common Resource Types:
======================

For more information and options, Reference:
<https://docs.openstack.org/heat/rocky/template_guide/openstack.html>

*\*Note the version in red, ensure this matches the version you are working on
to ensure compatability.*

*Network:* The resource type for a Heat Template is: OS::Neutron::Net. Define
with a name, administrative state (up or down) and numerous optional properties.
User defined networks do not have access externally unless connected through a
router with a gateway. *There is a special “public” network defined that
connects externally by default.*

*Subnet:* The resource type for a Heat Template is: OS::Neutron::Subnet. Define
subnet properties (IP addressing information, DNS, Routes, etc) and assign it to
a network.

**Router:** The resource type for a Heat Template is: OS::Neutron::Router.
Define a router and configure a gateway if you desire external connectivity.

*Router Interface:* The resource type for a Heat Template is:
OS::Neutron::RouterInterface. Define interfaces assigned to the router that
connect user defined networks.

*Port:* The resource type for a Heat Template is: OS::Neutron::Port. Defines
attributes (subnet, fixed IP address is desired, port-security etc.) and can be
specifically assigned to an instance.

*Instance:* The resource type for a Heat Template is: OS::Nova::Server.
Additionally, the type may point to a YAML file or URL. The resource must have
mandatory properties must be defined (optional properties may be used but are
not required).

Key for Customization: Cloud-init
=================================

Referenced from : <https://cloudinit.readthedocs.io/en/latest/>

Cloud-init is the *industry standard* multi-distribution method for
cross-platform cloud instance initialization. It is supported across all major
public cloud providers, provisioning systems for private cloud infrastructure,
and bare-metal installations.

Cloud instances are initialized from a disk image and instance data:

-   Cloud metadata

-   User data (optional)

-   Vendor data (optional)

Cloud-init will identify the cloud it is running on during boot, read any
provided metadata from the cloud and initialize the system accordingly. This may
involve setting up the network and storage devices to configuring SSH access key
and many other aspects of a system. Later on the cloud-init will also parse and
any optional user or vendor data that was passed to the instance.

Do I need to setup Networking?
==============================

**Short answer, not unless you have specific IP needs.** Each instance has a
private, fixed IP address (or more if you configure it) and can also have a
public, or floating IP address. Private IP addresses are used for communication
between instances, and public addresses are used for communication with networks
outside the cloud, including the Internet.

When you launch an instance, it is *automatically assigned a private IP address*
that stays the same until you explicitly terminate the instance. Rebooting an
instance has no effect on the private IP address.

Getting Started (with Horizon)
==============================

Assuming you will first be interacting with Openstack through a web browser, you
can access the canonical based dashboard through “Horizon”. Interactions with
the OpenStack cloud environment will be done within your “project”. This is the
area where you are able to deploy and interact with the resources allocated to
you. You may have access to one, or more projects; additionally, multiple
individuals work within a single project. Familiarizing yourself with the menu
options available on the left hand side of the browser is important.

1.  Under your Project tab, you will find everything you need to deploy and
    access your stack.

2.  Expanding the orchestration tab, you will see the option for “Stacks”. *This
    is where you will deploy templates.*

3.  You will hit the “+ Launch Stack” button.

![Project/Orchestration](images\OrchTab.png)

4.  You may provide a file located on your local machine, a URL, or direct
    input. The URL may point to a code repository, but ensure you use the “raw”
    URL, and not the HTML rendered view as when you browse to the file.

5.  If using an environment file, this is selected in the same way, at the same
    tab as the template file with the options of a file or direct input.
    
    ![Stack Create](images\StackCreate.png)

6.  Provide any parameters required, or change parameter options as needed.

![Parameters](images\parameters.png)

7.  Expanding the compute tab, you will see the option for “instances”. This is
    where you can access the console for any of the instances you deploy in your
    stack. Click on the instance name, which opens a new view.
    
    ![Compute Access](images\ComputerAccess.png)

8.  From this instance view you will see a “Console” tab. This is where you can
    access the GUI/CLI of the instance OS.
    
    ![Console View](images\Console.png)

Want to give the Client a try?
==============================

<https://docs.openstack.org/newton/user-guide/common/cli-install-openstack-command-line-clients.html>

-   If using Linux, source the openrc.sh file in your terminal as indicated in
    the instructions.

-   If using Windows, create environment variables for all items with the
    openrc.sh file; you can use the client through PowerShell.
