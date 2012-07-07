/*
* Copyright (C) 2008 The Android Open Source Project
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
#include <hardware_legacy/vibrator.h>

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

// lenovo 
#define DEVICE_STATUS "/sys/devices/platform/vibrator/status"
// sucks
#define DEVICE_TIMER "/sys/devices/platform/vibrator/timer"

int vibrator_exists()
{
    int fd;

    fd = open(DEVICE_STATUS, O_RDWR);
    if(fd < 0)
        return 0;
    close(fd);
    return 1;
}

int sendit(int timeout_ms)
{
    int nwr, ret, fd, fds;
    char value[20];
    
    // vibration strength modifier
    int timer = timeout_ms * 3;

    fds = open(DEVICE_STATUS, O_RDWR);
    if(fds < 0)
            return errno;

    // set status to 1 if we want to start vibrating or to 0 to stop
    if (timeout_ms > 0)
        write(fds, "1", 1);
    else
        write(fds, "0", 1);

    close(fds);

    // send the interval
    fd = open(DEVICE_TIMER, O_RDWR);
    if(fd < 0)
        return errno;

    nwr = sprintf(value, "%d\n", timer);
    ret = write(fd, value, nwr);

    close(fd);

    return (ret == nwr) ? 0 : -1;
}
