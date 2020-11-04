==title==
    Mobile First is Not Always the Best Approach
==author==
    Andrew Barr
==description==
    This article was written in 2017 and discusses the added complexity of approaching development using mobile first. The landscape has changed over the last few years and I plan to update this article soon.
==tags==
    Article
==body==

During a recent discussion about launching a new online product, the topic turned to Mobile First design and delivery. It reminded me that there are two very different lenses used by technical people and business people. On the surface, Mobile First is a no-brainer for any B2C product. Regardless of segmentation, we all walk around with a little computer in our pocket. However, for the technical team, it’s not always as straight forward.

Whether we are talking about a massive enterprise or a new startup, you often hear references to minimum viable products and agile development with short sprints and continuous deployment. When done right this type of approach can be compelling. Invariably the key stakeholders (i.e. Management, Clients or your Sales Team) want to see something/anything early.

I promise I have a point about this but first some background.

The infrastructure and tools for developing websites and deploying them are well understood and stable. Over the last 30 years, smart people have been able to work as a collective and bit by bit introduce a set of standards, frameworks and library’s that takes the pain out making something that works in a web browser. Regardless of whether you use Windows, Mac or a Linux and IE, Safari, Chrome or Firefox you will have the same experience (For the most part anyway).

We have not yet reached that point with mobile devices.

Apart from the simplest of applications the decisions required for Mobile First go far beyond an interface that auto-resizes based on the size of the screen and whether you use graceful degradation or progressive enhancement (For what its worth, if in doubt my advice is progressive enhancement).

The first decision for your technical team is whether they stick with a Web App or build a Native App. If they go down the Native App path; do they create one per device OS or do they use a framework like Ionic, React Native or Komodo to generate individual apps from a single codebase. If they go down the Web App path; do they use service workers (https://goo.gl/QNVtPa) or implement AMP (https://goo.gl/NBftao).

For each of the options above, there are trade-offs. It might be the complexity of supporting the app. It might be not having access to device features, or it might mean you become tightly coupled to an organisation that has different technical goals.

The types of technical questions your team will be asking themselves are; how important is performance? Do we think we will need access to device-specific features (e.g. face recognition)? Will we support phones and tablets with the same OS with a single app? Does the app need to work offline and if so does it eventually synchronise with a back-end?

Additionally, they will be thinking about the backend architecture and security. Do we need multi-tenancy? Do we need dynamic branding? What sort of API will support our native/web app (SOAP, REST, GraphQL)?

The types of management questions they will be asking themselves are; do we have the skills for one or more of these options?, Do we split the team into smaller teams focussed on areas of expertise? Does this make me redundant? Don’t discount the instinct of developers to want to use the ‘thing’ they are already good at using.

So my point (Finally) is there is that deciding to develop an application with Mobile First design and architecture is not always straightforward. As a business person, we should spend the time to understand that your technical team does not always have everything they need to make a perfect decision, especially early and especially if they are being asked to deliver something/anything as soon as they can.

My advice is to be a part of the decision-making process when you can and take the time to understand that you might be making a decision that makes life hard in the future and that’s OK.

<span class="pt-20">&nbsp</span>