package experience;

import com.intuit.karate.junit5.Karate;

class ExperienceRunner {
    @Karate.Test
    Karate testSearchResult() {
        return Karate.run("searchResult").relativeTo(getClass());
    }
}