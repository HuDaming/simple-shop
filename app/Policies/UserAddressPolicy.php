<?php

namespace App\Policies;

use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserAddressPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @param User $user
     * @param UserAddress $address
     * @return bool
     */
    public function own(User $user, UserAddress $address)
    {
        return $address->user_id == $user->id;
    }
}
