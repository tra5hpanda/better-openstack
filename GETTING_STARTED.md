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

![Project/Orchestration](media/0d53cc89a9d5aa1451fc862c4e56ad26.png)

Project/Orchestration

4.  You may provide a file located on your local machine, a URL, or direct
    input. The URL may point to a code repository, but ensure you use the “raw”
    URL, and not the HTML rendered view as when you browse to the file.

5.  If using an environment file, this is selected in the same way, at the same
    tab as the template file with the options of a file or direct input.

![Stack Create](media/94295511f1cec7a6c53e483ada35b0a8.png)

    Stack Create

6.  Provide any parameters required, or change parameter options as needed.

![Parameters](media/6ccb59744db54c079c024945dc9d01ac.png)

Parameters

7.  Expanding the compute tab, you will see the option for “instances”. This is
    where you can access the console for any of the instances you deploy in your
    stack. Click on the instance name, which opens a new view.

-   Compute Access

    Compute Access

8.  From this instance view you will see a “Console” tab. This is where you can
    access the GUI/CLI of the instance OS.

![Console View](media/bac4d1802a17e8b345bcde2a9da43b6d.png)

    Console View

Want to give the Client a try?
==============================

<https://docs.openstack.org/newton/user-guide/common/cli-install-openstack-command-line-clients.html>

-   If using Linux, source the openrc.sh file in your terminal as indicated in
    the instructions.

-   If using Windows, create environment variables for all items with the
    openrc.sh file; you can use the client through PowerShell.
