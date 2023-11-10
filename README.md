# Procare Online Platform Engineering Exercise

We strive to be a practical and pragmatic platform engineering team. That extends to the way that we work with you to understand if this team is a great fit for you. We want you to come away with a great understanding of the kind of things that we actually do day to day and what it is like to work in our teams.

We don't believe that whiteboard coding with someone watching over your shoulder accurately reflects our day to day. Instead we'd like to be able to discuss code that you have already written when we meet.

This can be a project of your own or a substantial pull request on an open source project, but we recognize that most people have done private or proprietary work and this engineering challenge is for you.

We realize that taking on this assignment represents a time commitment for you, and we do not take that lightly. Throughout the recruitment process we will be respectful of your time and commit to working quickly and efficiently. This will be the only technical assessment you'll be asked to do. The brief following conversations will be based on this assessment and your prior experiences.

The goal of this exercise is fairly simple: deploy this Rails app.

## Challenge Guidelines
This is meant to be an assignment that you spend approximately two to three hours of focused time on. Do not feel that you need to spend extra time to make a good impression. Smaller amounts of high quality code will let us have a much better conversation than large amounts of low quality code.

Think of this like an open source project. Create a repo on Github or Bitbucket, use git for source control, and use a Readme file to document what you built for the newcomer to your project.

We build systems engineered to run in production. Given this, please organize, design, test, deploy, and document your solution as if you were going to put it into production. We completely understand this might mean you can't do much in the time budget, and we do not expect the usage of anything beyond free-tier resources in order to support it. **Prioritize production-readiness over features.**

Think out loud in your documentation. Write out tradeoffs decisions, the thoughts behind your choices, or things you would do or do differently if you were able to spend more time on the project or do it a second time.

Our team supports a large Ruby/Rails monolith, as well as several other Ruby based applications. For that reason this exercise is centered around a Ruby/Rails app, inspired by an example application relevant to the work our team does, and is aspiring to do. A big thank you to Karafka, and its example apps, for the bulk of this sample  application. You can learn more about that framework here: https://github.com/karafka/example-apps/tree/master/v2.2-rails

With those guidelines in place, the challenge is relatively straightforward: choose one of the adventures documented below, and deploy it somewhere for us to review. We need to see running code, preferably deployed on AWS infrastructure.

## Choose Your Own Adventure(s)

As a Platform Engineering Team, our efforts are focused into three functional areas: stability, delivery, and strategy. As such, we invite you to implement one of these adventures in the application.

### Stability Adventure
NewRelic is reporting increasingly long response times in requests to the /visits page. How could we improve the stability of this endpoint?

### Delivery Adventure
The business risk unit wants CI/CD to run before any deploys to production, and block those deploys if it doesn't pass. They also don't want anything to go out that would jeopardize system response times. What could you write to achieve this?

### Strategy Adventure
Our product team wants to be able to show a real-time view of attendance as it is created, updated, and destroyed. How might we go about achieving that?

### BYO Adventure
You tell us! Show off. Be creative. We're really interested in what you might build with this starter pack.


## Usage

1. Run database migrations and other bootstrap steps `./bin/container-bootstrap`
1. Run the web service `docker-compose run --service-ports web`
1. Run the consumer service `docker-compose run consumer`
1. Run the full stack in the background `docker-compose up -d`
1. Clean up `docker-compose down`

You can also run RSpec tests 
```
docker-compose run web rspec spec
```
