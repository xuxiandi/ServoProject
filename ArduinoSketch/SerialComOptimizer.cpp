#include "SerialComOptimizer.h"

SerialComOptimizer::SerialComOptimizer(Stream* serial, Stream* secSerial) :
    serial(serial),
    serialVec({serial, secSerial}),
    readBufferGetIt(readBuffer.end() - 1),
    readBufferPutIt(readBuffer.begin()),
    writeBufferPutIt(writeBuffer.begin())
{
}

SerialComOptimizer::SerialComOptimizer(const SerialComOptimizer& in) :
    serial(in.serial),
    serialVec(in.serialVec),
    readBuffer(in.readBuffer),
    readBufferGetIt((in.readBufferGetIt - in.readBuffer.begin()) + readBuffer.begin()),
    readBufferPutIt((in.readBufferPutIt - in.readBuffer.begin()) + readBuffer.begin()),
    writeBuffer(in.writeBuffer),
    writeBufferPutIt((in.writeBufferPutIt - in.writeBuffer.begin()) + writeBuffer.begin())
{
}


SerialComOptimizer::~SerialComOptimizer()
{
}

size_t SerialComOptimizer::available()
{
    int8_t bufferedAmount = readBufferPutIt - (readBufferGetIt + 1);
    if (bufferedAmount < 0)
    {
        bufferedAmount = readBuffer.size() + bufferedAmount;
    }
    return bufferedAmount;
}

uint8_t SerialComOptimizer::read()
{
    ++readBufferGetIt;
    if (readBufferGetIt == readBuffer.end())
    {
        readBufferGetIt = readBuffer.begin();
    }

    return *readBufferGetIt;
}

void SerialComOptimizer::write(uint8_t byte)
{
    *writeBufferPutIt = byte;
    ++writeBufferPutIt;
}

void SerialComOptimizer::collectReadData()
{
    int32_t readAmount = readBufferGetIt - readBufferPutIt;
    if (readAmount < 0)
    {
        readAmount = readBuffer.size() + readAmount;
    }

    if (readAmount == 0)
    {
        return;
    }

    int32_t availableInHardwarBuffer = 0;

    for (auto s : serialVec)
    {
        if (s != nullptr)
        {
            availableInHardwarBuffer = s->available();
        }

        if (availableInHardwarBuffer != 0)
        {
            serial = s;
            break;
        }
    }

    if (availableInHardwarBuffer < readAmount)
    {
        readAmount = availableInHardwarBuffer;
    }

    std::array<char, 32> tempReadBuffer;
    readAmount = serial->readBytes(tempReadBuffer.data(), static_cast<size_t>(readAmount));

    if (readAmount < 0)
    {
        readAmount = 0;
    }

    for (auto it = tempReadBuffer.begin(); it != tempReadBuffer.begin() + readAmount; ++it)
    {
        *readBufferPutIt = *it;

        ++readBufferPutIt;
        if (readBufferPutIt == readBuffer.end())
        {
            readBufferPutIt = readBuffer.begin();
        }
    }
}

void SerialComOptimizer::sendWrittenData()
{
    serial->write(writeBuffer.data(), writeBufferPutIt - writeBuffer.begin());
    writeBufferPutIt = writeBuffer.begin();
}
