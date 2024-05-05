# Probabilistic Analysis of *654* (aka Ship, Captain, Crew)

## *654* is a popular dice game played in bars, especially in the Midwestern United States. See the rules [here](https://en.wikipedia.org/wiki/Ship,_captain,_and_crew).

Here I have provided an implementation of *654* in PRISM modeling language in (`654.pm`).

I also provide a few example PRISM specifications (`654.specs`), such as
    
    What is the maximum probability of ending with the maximum score 27?

    What is the maximum probability of ending with a score greater than 20?

### Model check properties on this system (and export a strategy to stdout):

```shell
prism 654.pm 654.specs -exportstrat stdout
```
See output for running this command in `out.log`.

(I am currently running out of memory in answering this question. Working to figure that out.)