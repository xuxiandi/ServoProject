#include <ArduinoEigenDense.h>
#include "EncoderHandler.h"
#include "CurrentControlLoop.h"
#include "OpticalEncoderHandler.h"
#include "ResistiveEncoderHandler.h"
#include "ArduinoC++BugFixes.h"
#include "CommunicationHandlers.h"

#ifndef DEFAULT_CONFIG_HOLDER_H
#define DEFAULT_CONFIG_HOLDER_H

class DefaultConfigHolder
{
public:
    static std::unique_ptr<CurrentController> createCurrentController()
    {
        return std::make_unique<CurrentControlLoop>(400);
    }

    static std::unique_ptr<EncoderHandlerInterface> createOutputEncoderHandler()
    {
        return std::make_unique<EncoderHandler>(A5);
    }

    static std::unique_ptr<OpticalEncoderHandler> createMainEncoderHandler()
    {
        std::array<uint16_t, 2048> aVec = {};
        std::array<uint16_t, 2048> bVec = {};
        return std::make_unique<OpticalEncoderHandler>(aVec, bVec, A2, A3, 4096.0f);
    }

    class DefaultControlParameters
    {
      public:
        static Eigen::Vector3f getKVector()
        {
            Eigen::Vector3f K;
            K << 0.0f,
                0.0f,
                0.0f;

            return K;
        }

        static Eigen::Matrix3f getAMatrix()
        {
            Eigen::Matrix3f A;
            A << 1.0f, 0.0f, 0.0f,
                0.0f, 1.0f, 0.0f,
                0.0f, 0.0f, 1.0f;

            return A;
        }

        static Eigen::Matrix3f getAInvMatrix()
        {
            Eigen::Matrix3f AInv;
            AInv << 1.0f, 0.0f, 0.0f,
                0.0f, 1.0f, 0.0f,
                0.0f, 0.0f, 1.0f;

            return AInv;
        }

        static Eigen::Vector3f getBVector()
        {
            Eigen::Vector3f B;
            B << 0.0f,
                0.0f,
                0.0f;

            return B;
        }

        static float getMaxVelocity()
        {
            return std::numeric_limits<float>::max();
        }

        static float getFrictionComp()
        {
            return 0.0f;
        }

        static std::array<int16_t, 512> getPosDepForceCompVec()
        {
            std::array<int16_t, 512> posDepForceCompVec{0};

            return posDepForceCompVec;
        }
    };
};

template<typename T>
std::unique_ptr<DCServo> createDCServo()
{
    auto currentController = T::createCurrentController();
    auto mainEncoder = T::createMainEncoderHandler();
    auto outputEncoder = T::createOutputEncoderHandler();
    auto controlConfig = DefaultControlConfiguration::create<typename T::ControlParameters>(mainEncoder.get());
    bool kalmanFilterApproximation = controlConfig->getCycleTime() < 0.0012f;
    auto kalmanFilter = KalmanFilter::create<typename T::ControlParameters>(kalmanFilterApproximation);

    return std::make_unique<DCServo>(
            std::move(currentController),
            std::move(mainEncoder),
            std::move(outputEncoder),
            std::move(kalmanFilter),
            std::move(controlConfig));
}

#endif
