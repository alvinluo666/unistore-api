<?php

namespace Database\Factories;

use App\Models\LeaveCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class LeaveCategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = LeaveCategory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'middle_id' => $this->faker->randomElement($array=array(1,2,3,4,5,6,7,8,9,10)),
            'name' => 'အမျိုးအစား',
            'image' => 'test.png'
        ];
    }
}
