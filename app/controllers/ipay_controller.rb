class IpayController < ApplicationController

    def index
        merchantkey = 'apple'
        @MerchantCode = 'M00003'
        @PaymentId = '2'
        @RefNo = 'A00000001'
        @Amount = '1.00'.sub('.', '')
        @Currency = 'MYR'
        status = '1'
        k = merchantkey << @MerchantCode << @PaymentId << @RefNo << @Amount << @Currency << status
        puts k
        @sign = IpayHelper.getsign k
        render
    end

    def responsex
        render plain: 'ko'
    end

    def bresponsex
        render plain: 'RECEIVEOK'
    end

end
