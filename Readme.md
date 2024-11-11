# Key concepts

Let’s define what good architecture for the app actually means. There are many slightly different opinions about it, but in common it usually focuses on the
following set of requirements:

- Easy to read and understand
- Easy to reuse, extend, and scale
- Easy to test and tests are cheap
- Easy to debug, fix, and maintain
- Ease to onboard new developers

There are many easy, so the solution should be laconic with minimum boilerplate code and not be overengineered, otherwise it is hard to call it an easy one.
Simultaneously, it should be very efficient in terms of the development process. And I’d add one more important quality - solidity, architecture should be
rigid enough to resist being used inappropriately. For example, MVC is extremely easy to use incorrectly, and that is why we have the anti-pattern “Massive
ViewController” (instead of “Model-View-Controller”). Good architecture has to protect itself and the principles it is based on.

# Modern software is a Teamwork

All modern competitive mobile apps are developed by teams.

Teamwork means the app must allow parallel development and must do it easily. It also means that each part of the app is developed by many developers. It leads
that the architecture must have strong rules about where each specific part of code must be located and how implemented. Also, the architecture must have a
high level of consistency, otherwise, one developer will not be able to continue another developer’s work. Taking it all into account, the architecture must
provide an exceptional level of testability. In the case of intensive development, the architecture should also provide a good level of horizontal scalability
without increasing the cognitive load for reading and understanding the codebase. 

# The problems of popular patterns

Architecture is a kind of tradeoff, and there are consequences. Such architectural patterns like MVC, MVP, and MVVM are very simple and it’s easy to start to
use them just after short learning. But the other side of this simplicity is these patterns describe a common approach of segregation codebase only and could
be understood and implemented very differently. As a result, each team has its own rules on how they try to keep a separation between layers, and these rules
could usually be (in practice this means most likely will be) broken quite easily. A typical problem of these patterns is a massive business logic layer, which
is hard to test properly because, without clear boundaries between layers, it tends to use service layers and other entities directly without dependency
injection.

# The Elm architecture

The Elm architecture is well known in web development, but rarely considered for something else, including mobile development. Obviously, it’s not possible to
use an architecture that was developed for the web in mobile development as it is. However, it is possible to take out the best ideas, extend them according to
mobile specifics, and implement a working prototype. 

What is the Elm architecture in a nutshell?

Any Elm program is always split into the following:

- Model, that keeps the current state of the app
- View, which converts the Model to the User Interface (UI)
- Message, which is an event that comes from the UI to Update
- Update, which produces a new Model, based on a Message

![Elm scheme](Images/elm_scheme.jpeg)
