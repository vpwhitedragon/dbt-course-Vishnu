**Explain the marts models you added. Why did you organize the models in the way you did?**

I grouped most of models into staging and intermediate so they they could be reused between differnt marts isntead of reinventing the wheel again. My DAG does look like spahgetti but in the view reusablity to derive more insights it will be useful.

**What assumptions are you making about each model? **

My assumptions for each models is there are no duplicates based on key columns


**Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**

Yes, there were many bad in the source. I filtered out most of them in the staging layer before moving it to marts also sometime these cokumns were defaults when null.

**Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.**

I would run my test as soon as the models are refreshed daily and would trigger an email with models with invalid data to stakeholders letting them know about ETA for the data to be fixed.
