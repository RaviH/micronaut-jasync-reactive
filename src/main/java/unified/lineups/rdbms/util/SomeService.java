package unified.lineups.rdbms.util;

import com.github.jasync.sql.db.QueryResult;
import lombok.AllArgsConstructor;

import javax.inject.Singleton;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;

@Singleton
@AllArgsConstructor
public class SomeService {

    private com.github.jasync.sql.db.Connection connection;

    public CompletableFuture<Integer> foo() {

        return connection.sendQuery("SELECT * FROM pg_stat_database")
                         .thenApply(new Function<QueryResult, Integer>() {
                             @Override
                             public Integer apply(final QueryResult queryResult) {

                                 return queryResult.getRows().size();
                             }
                         });
    }
}
