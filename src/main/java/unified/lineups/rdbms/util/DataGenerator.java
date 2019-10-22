package unified.lineups.rdbms.util;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.StopWatch;
import uk.co.jemos.podam.api.PodamFactoryImpl;
import unified.lineups.rdbms.entity.Service;
import unified.lineups.rdbms.repository.ServiceRepository;

import javax.inject.Singleton;
import java.util.concurrent.TimeUnit;

@Singleton
@AllArgsConstructor
@Slf4j
public class DataGenerator {

    private ServiceRepository serviceRepository;
    private final PodamFactoryImpl podamFactory = new PodamFactoryImpl();

    public void generate() {

        StopWatch channelStopWatch = new StopWatch();
        channelStopWatch.start();

        final Service service = new Service(null, "RXKr3PsPlN");
        serviceRepository.save(service);


        channelStopWatch.stop();
        log.info("Took {}s time to create 5700 channels", channelStopWatch.getTime(TimeUnit.SECONDS));
    }
}
